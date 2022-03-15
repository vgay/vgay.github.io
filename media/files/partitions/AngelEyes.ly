\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"


\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
}

title = #"Angel Eyes"
composer = #"Matt Dennis"
meter = #"(Ballad)"
kwtempo = #"Mod. Slow"
kwstyle = #"Ballad"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  %asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}



harmonies = \chordmode {
  \set chordChanges = ##f
  c2:m7 d4:m5-7 g:5+7 c2:m7 as:7 c:m7 a:m5-7
  d:m5-7 g:5+7 c:m7 d4:m5-7 g:5+7 c2:m7 a:m5-7 as:7 g:5+7

  c:m7 as4:7 g:5+7  c1:m6
  bes2:m7 es:7 as:7+ a:dim bes:m7 es:7 as:7+ des:7+ a:m7 d:7 g:7+ c:7+
  cis:m7 fis:7 d:m5-7 g:5+7
  c2:m7 d4:m5-7 g:5+7 c2:m7 as:7 c:m7 a:m5-7
  d:m5-7 g:5+7 c:m7 d4:m5-7 g:5+7 c2:m7 a:m5-7 as:7 g:5+7 d2:m5-7 g:5+7
  as:7 g:5+7 c1:m6
}

verse = \lyricmode {
  Try to think that love's not a -- round
  But it's un -- com -- fort -- 'bly near __
  My ol' heart ain't gai -- ning no ground
  Be -- cause my an -- gel eyes ain't here __ \markup \null



  \skip 1 drink up __ all you peo -- ple __
  Or -- der a -- ny -- thing you see __
  Have fun you hap -- py peo -- ple __
  The laugh's and the joke's on me __

  Par -- don me __ but I got to run __
  The facts un -- com -- mon -- ly clear __
  Got to find __  who's now num -- ber one __
  And why my an -- gel eyes ain't here __
  'scuse me while I dis _ -- ap -- pear. __
}

verseB = \lyricmode {
  An -- gel eyes, that old De -- vil sent
  They glow un -- bear -- a -- bly bright __
  Need I say that my love's mis -- spent
  Mis -- spent with an -- gel eyes to -- night __ \skip 1 So
}

theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    \mark #1 r8 c g' ges~ ges4. f8 | es4 \tuplet 3/2 { es8 c es~ } es2 |
    r8 c es g d' d c g~ | g1 | \break
    r8 c, g' ges~ ges4. f8 | es4 \tuplet 3/2 { es8 c es~ } es4. c8 |
    es c es c es4 es8 c~ |
  }
  \alternative {
    { c2 r }
    { c2. \repeatTie c'4 }
  }

  \bar "||" \break
  \mark #2
  c8 c4.~ c8 c bes es,~ | es es4.~ es2 |
  c'8 c4 c16 bes c4 bes8 es,~ | es2. c'4 | \break
  b2~ b8 a4 b16 a | d,8 d4.~ d4 r8 e |
  fis fis fis fis~ fis4 fis8 g~ | g1 \break \bar "||" \mark #1
  r8 c, g' ges~ ges4. f8 | es4 \tuplet 3/2 { es8 c es~ } es2 |
  r8 c es g d' d c g~ | g1 | \break
  r8 c, g' ges~ ges4. f8 | es4 \tuplet 3/2 { es8 c es~ } es4. c8 |
  es c es c es4 es8 c~ | c1 \bar "|."
}
outro =  \relative c' {
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup  \box Outro
  es8 c es c bes' g f g~ | g1
  \bar ".." }


grille = \chordmode {
  \bar "[|:" \mark #1
  c2:m7 d4:m5-7 g:5+7  c2:m7 as:7  c2:m7 as:m5-7  d:m5-7 g:5+7  \break
  c2:m7 d4:m5-7 g:5+7  c2:m7 a:m5-7  as:7 g:5+7  \set Score.repeatCommands = #'((volta "1.") )
  c2:m7 as4:7 g:5+7 \set Score.repeatCommands = #'((volta #f)  end-repeat) \break
  \stopStaff s1 \bar "" s \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2.") )
  c1:m6 \set Score.repeatCommands = #'((volta #f))  \bar "||" \break \mark #2
  bes2:m7 es:7  as:7+ a:dim  bes2:m7 es:7  as:7+ des:7+ \break
  a:m7 d:7 | g:7+ c:7+ | cis:m7 fis:7 | d:m7 g:5+7 | \break \mark #1 \bar "||"
  c2:m7 d4:m5-7 g:5+7  c2:m7 as:7  c2:m7 as:m5-7  d:m5-7 g:5+7  \break
  c2:m7 d4:m5-7 g:5+7  c2:m7 a:m5-7  as:7 g:5+7 d:m5-7 g:5+7  \break \bar "|."
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \column { \pad-around #2 "  " \box Outro }
  as:7 g:5+7 | c1:m6  \bar ".."  \stopStaff s1 \bar "" s  \bar ""
}



\book {
  \paper {
    #(set-paper-size "a5landscape")
    ragged-last = ##f
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          { \theNotes  \outro }
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    ragged-last = ##f
    page-count = #1
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          { \transpose c d \theNotes  \transpose c d \outro }
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    ragged-last = ##f
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          { \transpose c a \theNotes  \transpose c a \outro }
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          { \theNotes \break \outro }
        >>
      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          { \transpose c d \theNotes \break \transpose c d \outro }
        >>
      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          { \transpose c a \theNotes \break \transpose c a \outro }
        >>
      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          { \theNotes \break \outro }
          \addlyrics \verse
          \addlyrics \verseB
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
  }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          { \theNotes \break \outro }
          \addlyrics \verse
          \addlyrics \verseB
        >>
      >>
} } }