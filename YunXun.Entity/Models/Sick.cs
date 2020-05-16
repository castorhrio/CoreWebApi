namespace YunXun.Entity.Models
{
    /// <summary>
    /// Defines the <see cref="SickEntity" />.
    /// </summary>
    public class SickEntity : BaseEntity<int>
    {
        /// <summary>
        /// Gets or sets the title
        /// 产后疾病标题.
        /// </summary>
        public string title { get; set; }

        /// <summary>
        /// Gets or sets the overview
        /// 概述.
        /// </summary>
        public string overview { get; set; }

        /// <summary>
        /// Gets or sets the acupoint
        /// 穴位按摩.
        /// </summary>
        public string acupoint { get; set; }

        /// <summary>
        /// Gets or sets the pathogeny
        /// 常见病因及症状.
        /// </summary>
        public string pathogeny { get; set; }

        /// <summary>
        /// Gets or sets the analysis
        /// 病因分析与鉴别.
        /// </summary>
        public string analysis { get; set; }

        /// <summary>
        /// Gets or sets the food
        /// 饮食调理.
        /// </summary>
        public string food { get; set; }

        /// <summary>
        /// Gets or sets the IsDelete.
        /// </summary>
        public int IsDelete { get; set; }
    }
}
